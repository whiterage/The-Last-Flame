# The Last Flame — Неделя 1: Старт проекта

## 🎯 Цели недели
- Установить и настроить Godot 4
- Настроить GitHub-репозиторий и структуру проекта
- Освоить основы GDScript и интерфейса Godot
- Создать базовую сцену игрока с управлением
- Создать прототип первого уровня

---

## ✅ Выполнено
- [x] Установлен Godot 4
- [x] Создан репозиторий `the-last-flame` на GitHub
- [x] Настроен SSH-доступ и .gitkeep-файлы для отслеживания структуры
- [x] Создана базовая структура проекта:
  - `assets/`, `scenes/`, `scripts/`, `autoload/`
- [x] Добавлен README.md (на русском языке)
- [x] Реализовано движение, прыжок и гравитация
- [x] Создана базовая сцена `World.tscn` с `StaticBody2D` землёй
- [x] Добавлен фон и Light2D, создающий атмосферу
- [x] Реализована механика угасания (`flame`) и смерть
- [x] Нарисована сцена с тайлсетом, фоном и ParallaxBackground
- [x] Настроен TileMap и коллизии, персонаж не проваливается
- [x] Подготовлена игровая зона с платформами для прыжков

---

## 🔧 В процессе
- [ ] Реализация переменной `flame` и логики её уменьшения
- [ ] Настройка HUD: индикатор огня (полоска или число)
- [ ] Обработка смерти при полном угасании: исчезновение и сообщение
- [ ] Добавление анимаций игрока (idle, run, jump)

---

## 📌 Следующие шаги
1. Реализовать механику угасания пламени (таймер, свет, переменная)
2. Добавить HUD с индикатором огня
3. Обработка смерти: исчезновение, затемнение, сообщение
4. Подключение врагов, урона и взаимодействий
5. Постепенное улучшение визуала и анимаций

---

## 🗂 Структура проекта (папки)
assets/
sprites/
sounds/
fonts/
scenes/
player/
enemies/
levels/
ui/
scripts/
player/
enemies/
ui/
autoload/

---

## 💬 Комментарии и заметки
- Первая неделя — самое важное: начать, не перегореть, дойти до результата
- ПК — основная платформа на старте, мобилки — позже
- Обсуждение по коду, арт-стилю и уровням выносится в отдельные чаты
- Прототип работает: прямоугольник-игрок, свет, таймер и текст смерти — готовы
- Цель — превратить это в полноценную сцену: земля, фон, анимации
- Завершён День 2: сцена с тайлсетом, фоном, платформами и базовыми коллизиями
