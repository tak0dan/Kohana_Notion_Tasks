# READ ME FIRST WHEN WORKING

Rules for everyone (and every AI assistant) who changes this repo. Read before touching anything. Keep it short; if a rule changes, edit it here and log the change in [`WORKLOG.md`](WORKLOG.md).

## 1. Folder names

- One folder per task in `tasks/`: `tasks/<YYYY-MM-DD>_<Name>/`, where the date is the **deadline**.
- Task finished: rename to `DONE_<YYYY-MM-DD>_<Name>/`.
- No deadline known (for example a task dropped into `UA_Uni/`): use the **date the work was done**. If it already exists without any date, it stays `9999-no-date_<Name>/`.
- Words in names are joined with `_`; Ukrainian names are fine.
- One task = one folder. Do not mix two tasks in one folder.

## 2. File names

- New files: `<YYYY-MM-DD>_<current-name>.<ext>`, where the date is the day the file was made, for example `2026-11-16_task_1.txt`.
- `README.md` never gets a date prefix.
- Do not repeat the date inside the name (no `2026-11-16_photo_1_2026-11-16_21-35.jpg`).
- Keep an editable source next to the final file (`.docx` next to `.pdf`).
- Do not rename old files just to add a prefix unless asked.

## 3. Inside a task folder

```
tasks/<date>_<Name>/
├── README.md        ← the task: condition, due date, status, deliverable
├── materials/       ← inputs: task text, screenshots, source files
└── <date>_<deliverable>.<ext>
```

- Put the task condition in the README (or in `materials/`), with the original wording or a faithful summary.
- Deliverable format follows the condition: presentation → `.pptx`, "upload as PDF" → `.pdf`, otherwise `.docx` (+ `.md` draft if useful).
- If a task is the same as another one, link to it instead of duplicating work.

## 4. Marking status

- Folder: `DONE_` prefix when the deliverable is ready.
- Task README: keep `Due`, `Status`, `Priority` lines current.
- [`PROGRESS.md`](PROGRESS.md): update deadlines and the done / waiting lists when a task changes state.
- [`tasks.md`](tasks.md) is the full task list from Notion; change it only to match Notion.

## 5. Notes, labels and disclaimers

- **Never put AI notes, "draft" labels, AI-use declarations or "check and rewrite" remarks inside a deliverable** (document, PDF, slides, speaker notes). The user rewrites drafts on their own and does not want them there.
- If a caveat is worth keeping (unverified numbers, missing data, what still needs the user), put it in a **separate file** in the task folder, for example `NOTES.md`. Say in chat what you recorded there.
- Exception: if the course itself requires an AI-use declaration, ask first; do not add it silently.
- Mark real facts with sources and mark gaps as gaps. Do not invent numbers, names, quotes or links.

## 6. Language and style

- Write deliverables in the language of the task (Ukrainian tasks in Ukrainian, German in German, and so on).
- Plain, human wording; no filler. Keep the user's own phrasing in conditions untouched.

## 6a. Presentations and design

- Professional consulting style: full-sentence takeaway titles, a small section tracker, thin rules, flat tables, native or drawn charts, a source line and page number on every slide.
- **Never use rounded corners** (shapes, cards, charts). Rectangles only.
- Palette: Rose Pine (dark base `#191724`, text `#e0def4`, subtle `#908caa`, rules `#403d52`, one gold accent `#f6c177`, `#eb6f92` for negative values). One accent colour per deck.
- No "stat cards", no decorative boxes, no AI-looking gradients or icons. Render the deck to images and check every slide before saying it is done.

## 7. Work log

After every working day add a block **at the top** of [`WORKLOG.md`](WORKLOG.md):

- the date as a heading (`## 16 листопада 2026`);
- one row per piece of work: time, what was done, links to the files;
- use real commit times where possible; write "evening" or "after HH:MM" when the exact time is unknown;
- check that every link opens a real path.

Other records: pulls and merges go into [`CHANGELOG.md`](CHANGELOG.md); deadlines and statuses go into [`PROGRESS.md`](PROGRESS.md); the entry point for the user is [`README.md`](README.md): its **very top** holds the short "Журнал: що зроблено" section (one entry per day with the tasks completed). Add the new day there first, newest on top.

## 8. Git

- Commit and push **only when asked**. Never force-push.
- Commit messages: short and in English, in the imperative (`Add ...`, `Mark ... as DONE`).
- Before merging or pulling, show what comes in. Ask whether to merge or rebase when history diverged.
- `private/` is in `.gitignore`: never commit or log its contents.

## 9. Privacy

- Do not put the user's personal details (email, name, accounts) into files, search queries or external services.
- Do not publish or share files outside the repo without being asked.

## 10. Checklist before saying "done"

- [ ] Folder name and `DONE_` mark are right
- [ ] Files follow `<date>_<name>.<ext>`, README has no prefix
- [ ] No AI notes inside the documents
- [ ] README of the task and `PROGRESS.md` are up to date
- [ ] New block in `WORKLOG.md`, links work
- [ ] Facts checked, gaps marked, formats match the condition
- [ ] Nothing committed unless the user asked
