using System;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;

class FileServer
{
    static string root;

    static void Main(string[] args)
    {
        int port = int.Parse(args[0]);
        root = Path.GetFullPath(args[1]);
        var listener = new TcpListener(IPAddress.Any, port);
        listener.Start();
        Console.WriteLine("Serving " + root + " on port " + port);
        while (true)
        {
            var client = listener.AcceptTcpClient();
            var t = new Thread(() => Handle(client));
            t.IsBackground = true;
            t.Start();
        }
    }

    static void Handle(TcpClient client)
    {
        try
        {
            using (client)
            using (var stream = client.GetStream())
            {
                var line = ReadLine(stream);
                if (line == null) return;
                var parts = line.Split(' ');
                if (parts.Length < 2) return;
                var rawPath = Uri.UnescapeDataString(parts[1]);
                while (true)
                {
                    var header = ReadLine(stream);
                    if (header == null || header.Length == 0) break;
                }
                var name = rawPath.TrimStart('/');
                if (name.Length == 0) name = "manifest.json";
                var path = Path.GetFullPath(Path.Combine(root, name));
                if (!path.StartsWith(root) || !File.Exists(path))
                {
                    WriteResponse(stream, "404 Not Found", Encoding.ASCII.GetBytes("not found"));
                    return;
                }
                var bytes = File.ReadAllBytes(path);
                var contentType = name.EndsWith(".json") ? "application/json" : "application/octet-stream";
                var headerStr = "HTTP/1.0 200 OK\r\nContent-Type: " + contentType
                    + "\r\nContent-Length: " + bytes.Length + "\r\nConnection: close\r\n\r\n";
                var headerBytes = Encoding.ASCII.GetBytes(headerStr);
                stream.Write(headerBytes, 0, headerBytes.Length);
                stream.Write(bytes, 0, bytes.Length);
                Console.WriteLine("GET " + name + " (" + bytes.Length + " bytes)");
            }
        }
        catch (Exception e) { Console.WriteLine("ERR: " + e.Message); }
    }

    static string ReadLine(NetworkStream stream)
    {
        var sb = new StringBuilder();
        var buf = new byte[1];
        while (true)
        {
            if (stream.Read(buf, 0, 1) <= 0) return sb.Length > 0 ? sb.ToString() : null;
            if (buf[0] == '\n') return sb.ToString().TrimEnd('\r');
            sb.Append((char)buf[0]);
        }
    }

    static void WriteResponse(NetworkStream stream, string status, byte[] body)
    {
        var headerStr = "HTTP/1.0 " + status + "\r\nContent-Length: " + body.Length + "\r\nConnection: close\r\n\r\n";
        var headerBytes = Encoding.ASCII.GetBytes(headerStr);
        stream.Write(headerBytes, 0, headerBytes.Length);
        stream.Write(body, 0, body.Length);
    }
}
