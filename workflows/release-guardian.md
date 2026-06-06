---
description: "/release-guardian - Страж деплоя. Финальный pre-deploy gate: проверка типов, линтинг, запуск тестов, проверка env vars и миграций."
version: 1.0
mode: STRICT
colmobrain_first: true
---

# /release-guardian

Pre-deploy ворота качества. Защищает продакшн от регрессий и падений при выкатке.

## Алгоритм работы (Распаковка)

1. **Контроль изменений**:
   - `invoke_subagent` [Blast-Radius]: Проверяет `git diff main` на наличие непреднамеренных изменений.
   - Исключает коммит, если Blast Radius нарушен.

2. **Параллельная верификация кода**:
   - `invoke_subagent` [Type-Checker]: Запускает `npm run type-check`. Должно быть 0 ошибок.
   - `invoke_subagent` [Lint-Checker]: Запускает `npx eslint --quiet`. Должно быть 0 ошибок.
   - `invoke_subagent` [Test-Runner]: Запускает `npm run test` (или `npx vitest run` на наши тесты). Все тесты должны пройти (GREEN).
   - `invoke_subagent` [Security-Scanner]: Запускает `npm run security-scan` (AgentShield). Любая уязвимость уровня High/Critical блокирует деплой.

3. **Валидация окружения, базы и цен**:
   - `invoke_subagent` [Env-Validator]: Проверяет env-файлы на корректность структуры и наличие обязательных переменных (по ADR-002 и CLAUDE.md).
   - `invoke_subagent` [Migration-Checker]: Проверяет файлы миграций в `src/lib/db/migrations/` на соответствие `scripts/production_schema.sql` и контролирует отсутствие несанкционированных изменений тарифов в базе данных.
   - `invoke_subagent` [Pricing-Validator]: Сканирует новые изменения в коде/контенте, сверяя любые упоминания цен с [docs/ECON_MODEL_CANONICAL.md](file:///Users/nikiti4/Downloads/Antigravity/docs/ECON_MODEL_CANONICAL.md). Любые отклонения блокируют релиз.

4. **Rollback Plan**:
   - `invoke_subagent` [Rollback-Planner]: Генерирует быстрый план отката для текущего билда на случай аварии.

5. **Вердикт**:
   - Если все проверки GREEN → Выдает DEPLOY ✅.
   - Если хотя бы одна проверка RED → Выдает BLOCKED ❌ с указанием причин и коммитит отчет о блокировке.
   - Выполняет `rag_ingest` о статусе релиза.

## Правила
- Любая ошибка tsc или eslint блокирует деплой.
- Все P0 issues на GitHub должны быть закрыты перед выкаткой.
