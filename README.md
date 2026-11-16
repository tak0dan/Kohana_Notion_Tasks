## 🗒 Журнал: що зроблено

**16 листопада 2026**: завдання 1–3 виконано
- Завдання 1: [політика відновлення Харкова, аналіз 8 рекомендацій і перепон (PDF)](tasks/2026-11-16_Харків_політика_відновлення/)
- Завдання 2: [інноваційний та інвестиційний потенціал Харкова (презентація)](tasks/2026-11-16_Харків_інноваційний_потенціал/)
- Завдання 3: [імпакт-фінансування, Erasmus 3](tasks/DONE_2026-11-17_Еразмус_непрядкіна_3/) (матеріали додано)
- Об'єднано з `origin/main`, прибрано позначки про ШІ з документів, файли розкладено по папках

**8 листопада 2026**: Естонія, Research methodology 2 (Section 3), Erasmus 1 і 3, РГР «Агроекспорт», ІНДЗ «Шерінгова економіка», PM, German oral, HRM, облік і аудит ([деталі](WORKLOG.md))

**3 листопада 2026**: створено репо, папки задач, практичні з маркетингу, рецензії для Geopolitics, нотатки з даних Естонії

➡ Повний журнал із часом і посиланнями на файли: **[WORKLOG.md](WORKLOG.md)**

> ⚠️ **Працюєш із репо? Спершу прочитай [READ_ME_FIRST_WHEN_WORKING.md](READ_ME_FIRST_WHEN_WORKING.md)**: правила назв, позначок, приміток і журналу.

---

<p align="center">
  <a href="PROGRESS.md">
    <img src="assets/progress-button.svg" alt="Відкрити прогрес і дедлайни" width="560">
  </a>
</p>

# 📚 Ліза: усе, що потрібно зробити з Notion-таблиці

Це твоє репо. Тут зібрано все з таблиці **«Suivi des tâches»**: по одній папці на кожну задачу, готові чернетки та список дедлайнів. Головна мета: закрити все до **12 листопада**, а головне, дедлайни **5 листопада** 💛

---

## 🚀 Швидкий старт: одна команда й усе встановиться

Скрипт нижче:
1. створить у твоїй домашній папці директорію **`Liza_Unis`**;
2. встановить через пакетний менеджер **Git**, **GitHub CLI** (`gh`), **GitHub Desktop** (тільки Windows), **lazygit** (текстовий інтерфейс для Git), **Notion** (графічний застосунок);
3. клонує туди це репо (а якщо воно вже там є, просто підтягне оновлення).

Посилання на репо вже вписано в перший рядок скриптів, нічого міняти не треба.

### 🪟 Windows

**Як відкрити термінал від імені адміністратора:**
1. Натисни **правою кнопкою миші на кнопку «Пуск»** (або клавіші `Win` + `X`).
2. Обери **«Термінал (адміністратор)»** (Windows 11) або **«Windows PowerShell (адміністратор)»** (Windows 10).
3. Натисни **«Так»** у вікні контролю облікових записів. Вгорі вікна має бути слово «Адміністратор».

Скопіюй увесь блок, встав у вікно (правою кнопкою миші) і натисни `Enter`:

```powershell
$Repo = "https://github.com/tak0dan/Kohana_Notion_Tasks.git"
$Dest = Join-Path $HOME "Liza_Unis"

# 1. Програми через winget (пакетний менеджер Windows)
$apps = @(
  "Git.Git",                      # Git
  "GitHub.cli",                   # gh: GitHub у терміналі
  "GitHub.GitHubDesktop",         # графічний інтерфейс (GUI)
  "JesseDuffield.lazygit",        # текстовий інтерфейс (TUI) для Git
  "Notion.Notion"                 # Notion (GUI)
)
foreach ($a in $apps) {
  winget install --id $a -e --silent --accept-package-agreements --accept-source-agreements
}

# 2. Оновити PATH, щоб git одразу працював у цьому вікні
$env:Path = [Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [Environment]::GetEnvironmentVariable("Path","User")

# 3. Папка Liza_Unis і клонування репо
if (Test-Path (Join-Path $Dest ".git")) {
  git -C $Dest pull
} else {
  git clone $Repo $Dest
}

Write-Host "Готово. Усе лежить у $Dest" -ForegroundColor Green
```

Після цього **закрий і знову відкрий** термінал, щоб нові програми були доступні всюди.

### 🐧 Linux (Arch / Manjaro або Ubuntu / Debian)

Відкрий термінал, встав блок і натисни `Enter`. Попросить пароль від системи (`sudo`):

```bash
REPO="https://github.com/tak0dan/Kohana_Notion_Tasks.git"
DEST="$HOME/Liza_Unis"

# 1. Програми через пакетний менеджер
if command -v pacman >/dev/null; then
  sudo pacman -S --needed --noconfirm git github-cli lazygit
  # Notion (GUI) є в AUR, тому потрібен yay
  if command -v yay >/dev/null; then
    yay -S --needed notion-app-electron
  else
    echo "yay не знайдено: Notion можна відкрити в браузері на notion.so"
  fi
elif command -v apt >/dev/null; then
  sudo apt update
  sudo apt install -y git gh
  sudo apt install -y lazygit || echo "lazygit немає в apt, пропускаю"
  echo "Notion для Debian/Ubuntu: відкрий notion.so у браузері"
fi

# 2. Папка Liza_Unis і клонування репо
if [ -d "$DEST/.git" ]; then
  git -C "$DEST" pull
else
  git clone "$REPO" "$DEST"
fi

echo "Готово. Усе лежить у $DEST"
```

### 🔑 Один раз після встановлення: увійти в GitHub

Якщо репо приватне, у терміналі виконай:

```
gh auth login
```

Обери **GitHub.com → HTTPS → Login with a web browser** і введи код, який покаже термінал. Для GitHub Desktop достатньо кнопки **Sign in**.

---

## 🔄 Як отримувати нові матеріали

Нові чернетки з'являтимуться в репо. Щоб їх забрати:

- **Термінал:** `cd ~/Liza_Unis` (на Windows `cd $HOME\Liza_Unis`), потім `git pull`
- **Текстовий інтерфейс:** запусти `lazygit` у цій папці
- **Мишкою:** відкрий GitHub Desktop, натисни **Fetch origin**, а потім **Pull origin**

Надсилати щось назад (`git push`) не потрібно.

---

## 🗂 Що де лежить

```
Liza_Unis/
├── README.md                      ← ти тут
├── READ_ME_FIRST_WHEN_WORKING.md  ← правила роботи з репо
├── WORKLOG.md                     ← журнал роботи по днях
├── PROGRESS.md                    ← дедлайни й статус
├── CHANGELOG.md                   ← що змінювалось у репо
├── tasks.md                       ← повний список задач із дедлайнами
└── tasks/
    ├── 2026-11-05_Маркетинг_тема_4/
    │   ├── README.md              ← статус, пріоритет, підзадачі
    │   └── materials/             ← сюди клади умови завдань і файли
    ├── 2026-11-09_Geopolitics_readings/
    │   ├── README.md
    │   ├── art_of_war_review.md   ← готове ревью
    │   └── art_of_war_all_quotes.md ← усі цитати книги
    └── …                          ← ще 30 папок, по одній на задачу
```

Папки названі за **датою дедлайну**, тому в списку вони йдуть за порядком термінів. Для задач без дедлайну (наприклад, завдання з `UA_Uni`) у назві стоїть дата роботи, а файли всередині мають префікс `<дата>_` (наприклад, `2026-11-16_назва.pdf`), щоб вони сортувалися за часом. Файл `README.md` лишається без префікса.

---

## 🔥 Найближчі дедлайни

| Коли | Задача | Статус |
|---|---|---|
| 05.11 (чт) | Маркетинг тема 4 | не розпочато |
| 05.11 (чт) | Міжнародна економіка завдання2 | не розпочато |
| 06.11 (пт) | Project Management resources and risk | в процесі |
| 09.11 (пн) | Geopolitics readings | в процесі |
| 10.11 | German oral | в процесі |
| 10.11 | Міжнародна економіка завдання3 | не розпочато |
| 10.11 | Євроінтеграція - Медицина | не розпочато |
| 12.11 | HRM project | в процесі |

Повний список: [`tasks.md`](tasks.md).

---

## 🙋 Часті питання

- **Скрипт на Windows пише, що не знайшов `winget`.** Онови «Інсталятор додатків» (App Installer) у Microsoft Store й запусти блок знову.
- **Просить логін на GitHub.** Виконай `gh auth login` (див. вище) або увійди через GitHub Desktop.
- **`git pull` пише про конфлікт або «local changes».** Нічого не видаляй. Скопіюй папку кудись як резервну копію й напиши нам.
- **Куди класти файли із завданнями?** У `tasks/<дата>_<назва>/materials/` відповідної задачі. Ми їх прочитаємо (скриншоти теж) і зробимо чернетку.

---

## 📝 Що ще потрібно від тебе

- [ ] Умови завдань на **05.11**: Маркетинг тема 4 (лекція, тести, практична 4, самостійне 4) і Міжнародна економіка завдання2
- [ ] Вимоги до ревью з Geopolitics (мова, обсяг) і яка саме "book2"
- [ ] Умови решти задач на тиждень (PM resources and risk, German oral, HRM project тощо)
