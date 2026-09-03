import 'package:flutter/material.dart';

import '../../../core/theme/utils/app_haptics.dart';
import '../../../core/theme/widgets/widgets.dart';
import '../../../l10n/generated/app_localizations.dart';

/// Интерактивная витрина компонентов дизайн-системы и UI Kit шаблона
class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  bool _isLoadingDemo = false;
  int _selectedChipIndex = 0;
  int _selectedSegment = 0;
  double _progressValue = 0.65;
  final _demoSearchController = TextEditingController();
  final _demoTextController = TextEditingController();
  final _demoPasswordController = TextEditingController(text: 'secret123');

  @override
  void dispose() {
    _demoSearchController.dispose();
    _demoTextController.dispose();
    _demoPasswordController.dispose();
    super.dispose();
  }

  void _triggerLoadingDemo() {
    setState(() => _isLoadingDemo = true);
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) {
        setState(() => _isLoadingDemo = false);
        AppToast.success(
          context,
          'Фоновая операция успешно завершена',
          title: 'Готово',
        );
      }
    });
  }

  void _openDemoSheet() {
    AppBottomSheet.show<void>(
      context,
      title: 'Интерактивная шторка',
      subtitle: 'Пример вызова AppBottomSheet с эффектом Liquid Glass',
      actions: [
        AppButton(
          label: 'Закрыть',
          variant: AppButtonVariant.tonal,
          size: AppButtonSize.small,
          onPressed: () => Navigator.of(context).pop(),
        ),
        AppButton(
          label: 'Подтвердить',
          variant: AppButtonVariant.filled,
          size: AppButtonSize.small,
          onPressed: () {
            Navigator.of(context).pop();
            AppToast.success(context, 'Действие подтверждено!');
          },
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Компонент AppBottomSheet автоматически адаптируется под размер клавиатуры, тему оформления и отступы безопасной зоны экрана.',
          ),
          const SizedBox(height: 16),
          const AppTextField(
            label: 'Поле внутри шторки',
            hint: 'Введите что-нибудь...',
            clearable: true,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final showcaseTitle = l10n?.navShowcase ?? 'Витрина компонентов';

    return Scaffold(
      appBar: AppBar(
        title: Text(showcaseTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
        children: [
          // 1. Секция Кнопок
          AppStaggeredItem(
            index: 0,
            child: _ShowcaseSection(
              title: 'Кнопки (AppButton & AppIconButton)',
              subtitle:
                  '5 вариантов, 3 размера, встроенная загрузка и пружинная физика',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      AppButton(
                        label: 'Filled',
                        variant: AppButtonVariant.filled,
                        onPressed: () => AppToast.info(context, 'Нажата кнопка Filled'),
                      ),
                      AppButton(
                        label: 'Tonal',
                        variant: AppButtonVariant.tonal,
                        onPressed: () => AppToast.info(context, 'Нажата кнопка Tonal'),
                      ),
                      AppButton(
                        label: 'Outlined',
                        variant: AppButtonVariant.outlined,
                        onPressed: () =>
                            AppToast.info(context, 'Нажата кнопка Outlined'),
                      ),
                      AppButton(
                        label: 'Ghost',
                        variant: AppButtonVariant.ghost,
                        onPressed: () => AppToast.info(context, 'Нажата кнопка Ghost'),
                      ),
                      AppButton(
                        label: 'Danger',
                        variant: AppButtonVariant.danger,
                        leadingIcon: const Icon(Icons.delete_outline_rounded),
                        onPressed: () => AppToast.error(
                          context,
                          'Критическое действие (Danger)',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          label: _isLoadingDemo ? 'Сохранение...' : 'Загрузка (Async)',
                          isLoading: _isLoadingDemo,
                          variant: AppButtonVariant.filled,
                          leadingIcon: const Icon(Icons.cloud_upload_outlined),
                          onPressed: _triggerLoadingDemo,
                        ),
                      ),
                      const SizedBox(width: 8),
                      AppIconButton(
                        variant: AppButtonVariant.tonal,
                        icon: const Icon(Icons.tune_rounded),
                        tooltip: 'Параметры',
                        onPressed: () => AppHaptics.light(),
                      ),
                      const SizedBox(width: 6),
                      AppIconButton(
                        variant: AppButtonVariant.outlined,
                        icon: const Icon(Icons.share_rounded),
                        tooltip: 'Поделиться',
                        onPressed: () => AppHaptics.light(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 2. Секция Полей ввода
          AppStaggeredItem(
            index: 1,
            child: _ShowcaseSection(
              title: 'Поля ввода (AppTextField & Search)',
              subtitle: 'Быстрая очистка, переключение видимости и стилизованный поиск',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppSearchField(
                    controller: _demoSearchController,
                    hint: 'Поиск по компонентам...',
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    controller: _demoTextController,
                    label: 'Имя пользователя',
                    hint: 'Введите имя',
                    clearable: true,
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    controller: _demoPasswordController,
                    label: 'Пароль',
                    hint: 'Введите пароль',
                    isPassword: true,
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 3. Секция Тостов и Уведомлений
          AppStaggeredItem(
            index: 2,
            child: _ShowcaseSection(
              title: 'Плавающие тосты (AppToast HUD)',
              subtitle: 'Всплывающие уведомления с размытием фона и жестом смахивания',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  AppButton(
                    label: 'Success',
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.tonal,
                    leadingIcon: const Icon(
                      Icons.check_circle_rounded,
                      color: Color(0xFF10B981),
                    ),
                    onPressed: () => AppToast.success(
                      context,
                      'Изменения успешно сохранены',
                      title: 'Успешно',
                    ),
                  ),
                  AppButton(
                    label: 'Error',
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.tonal,
                    leadingIcon: Icon(
                      Icons.error_outline_rounded,
                      color: colorScheme.error,
                    ),
                    onPressed: () => AppToast.error(
                      context,
                      'Не удалось соединиться с сервером',
                      title: 'Ошибка',
                    ),
                  ),
                  AppButton(
                    label: 'Warning',
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.tonal,
                    leadingIcon: const Icon(
                      Icons.warning_amber_rounded,
                      color: Color(0xFFF59E0B),
                    ),
                    onPressed: () => AppToast.warning(
                      context,
                      'Низкий заряд аккумулятора устройства',
                      title: 'Внимание',
                    ),
                  ),
                  AppButton(
                    label: 'Info',
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.tonal,
                    leadingIcon: Icon(
                      Icons.info_outline_rounded,
                      color: colorScheme.primary,
                    ),
                    onPressed: () => AppToast.info(
                      context,
                      'Доступна новая версия обновления',
                      title: 'Обновление',
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 4. Секция Модальных окон и шторок
          AppStaggeredItem(
            index: 3,
            child: _ShowcaseSection(
              title: 'Модальные шторки (AppBottomSheet)',
              subtitle: 'Унифицированные шторки со свайпом и Liquid Glass размытием',
              child: AppButton(
                label: 'Открыть модальную шторку',
                isFullWidth: true,
                variant: AppButtonVariant.outlined,
                leadingIcon: const Icon(Icons.vertical_align_bottom_rounded),
                onPressed: _openDemoSheet,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 5. Секция Бейджей и Чипов
          AppStaggeredItem(
            index: 4,
            child: _ShowcaseSection(
              title: 'Бейджи и теги (AppBadge & AppChip)',
              subtitle: 'Статусные индикаторы со свечением и интерактивные фильтры',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      AppBadge(
                        label: 'Primary',
                        variant: AppBadgeVariant.primary,
                      ),
                      AppBadge(
                        label: 'Active',
                        variant: AppBadgeVariant.success,
                        icon: Icon(Icons.check, size: 12),
                      ),
                      AppBadge(
                        label: 'Warning',
                        variant: AppBadgeVariant.warning,
                      ),
                      AppBadge(
                        label: 'Error',
                        variant: AppBadgeVariant.error,
                      ),
                      AppBadge(
                        label: 'Neutral',
                        variant: AppBadgeVariant.neutral,
                      ),
                      AppBadge(
                        label: 'Dot',
                        variant: AppBadgeVariant.success,
                        isDot: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(4, (index) {
                      final labels = ['Все', 'Flutter', 'Riverpod', 'GoRouter'];
                      return AppChip(
                        label: labels[index],
                        isSelected: _selectedChipIndex == index,
                        onTap: () {
                          AppHaptics.selection();
                          setState(() => _selectedChipIndex = index);
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 6. Секция Тактильной отдачи
          AppStaggeredItem(
            index: 5,
            child: _ShowcaseSection(
              title: 'Тактильная отдача (AppHaptics Engine)',
              subtitle: 'Безопасные семантические паттерны вибрации устройства',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  AppButton(
                    label: 'Selection',
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.tonal,
                    onPressed: () {
                      AppHaptics.selection();
                      AppToast.info(context, 'Haptic: Selection Click');
                    },
                  ),
                  AppButton(
                    label: 'Light',
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.tonal,
                    onPressed: () {
                      AppHaptics.light();
                      AppToast.info(context, 'Haptic: Light Impact');
                    },
                  ),
                  AppButton(
                    label: 'Medium',
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.tonal,
                    onPressed: () {
                      AppHaptics.medium();
                      AppToast.info(context, 'Haptic: Medium Impact');
                    },
                  ),
                  AppButton(
                    label: 'Heavy',
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.tonal,
                    onPressed: () {
                      AppHaptics.heavy();
                      AppToast.info(context, 'Haptic: Heavy Impact');
                    },
                  ),
                  AppButton(
                    label: 'Success Pattern',
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.tonal,
                    onPressed: () {
                      AppHaptics.success();
                      AppToast.success(context, 'Haptic: Success Pattern');
                    },
                  ),
                  AppButton(
                    label: 'Error Pattern',
                    size: AppButtonSize.small,
                    variant: AppButtonVariant.danger,
                    onPressed: () {
                      AppHaptics.error();
                      AppToast.error(context, 'Haptic: Error Pattern');
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 7. Секция Сегментированных переключателей (AppSegmentedControl)
          AppStaggeredItem(
            index: 6,
            child: _ShowcaseSection(
              title: 'Сегментированные контролы (AppSegmentedControl)',
              subtitle: 'Скользящий Liquid Glass индикатор с поддержкой иконок',
              child: Column(
                children: [
                  AppSegmentedControl<int>(
                    selectedValue: _selectedSegment,
                    onValueChanged: (val) => setState(() => _selectedSegment = val),
                    items: const [
                      AppSegmentItem(value: 0, label: 'День', icon: Icon(Icons.wb_sunny_outlined)),
                      AppSegmentItem(value: 1, label: 'Неделя', icon: Icon(Icons.calendar_view_week_outlined)),
                      AppSegmentItem(value: 2, label: 'Месяц', icon: Icon(Icons.calendar_month_outlined)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 8. Секция Прогресс-баров и Индикаторов (AppProgressBar)
          AppStaggeredItem(
            index: 7,
            child: _ShowcaseSection(
              title: 'Индикаторы прогресса (AppProgressBar)',
              subtitle: 'Неоновые градиенты со свечением и круговые спиннеры',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Загрузка (${(_progressValue * 100).round()}%)',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const AppCircularProgress(size: 20, strokeWidth: 2.5),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AppProgressBar(value: _progressValue),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const Text('0%', style: TextStyle(fontSize: 12)),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: colorScheme.primary,
                            thumbColor: colorScheme.primary,
                          ),
                          child: Slider(
                            value: _progressValue,
                            onChanged: (val) => setState(() => _progressValue = val),
                          ),
                        ),
                      ),
                      const Text('100%', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 9. Секция Аватаров и статусов (AppAvatar)
          AppStaggeredItem(
            index: 8,
            child: _ShowcaseSection(
              title: 'Аватары и присутствие (AppAvatar)',
              subtitle: '4 размера, статусная точка, инициалы и градиентный контур',
              child: Wrap(
                spacing: 14,
                runSpacing: 14,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  AppAvatar(
                    size: AppAvatarSize.small,
                    status: AppAvatarStatus.online,
                    initials: 'АС',
                    onTap: () => AppToast.info(context, 'Аватар Small (Online)'),
                  ),
                  AppAvatar(
                    size: AppAvatarSize.medium,
                    status: AppAvatarStatus.busy,
                    initials: 'МК',
                    onTap: () => AppToast.info(context, 'Аватар Medium (Busy)'),
                  ),
                  AppAvatar(
                    size: AppAvatarSize.large,
                    status: AppAvatarStatus.away,
                    initials: 'TG',
                    onTap: () => AppToast.info(context, 'Аватар Large (Away)'),
                  ),
                  AppAvatar(
                    size: AppAvatarSize.xlarge,
                    status: AppAvatarStatus.online,
                    initials: 'AG',
                    onTap: () => AppToast.info(context, 'Аватар XLarge (Online)'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShowcaseSection extends StatelessWidget {
  const _ShowcaseSection({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppGlassCard(
      borderRadius: 12,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}
