# Sim Manager setup

## 1. Supabase
1. Create a project at supabase.com, region **Frankfurt (eu-central-1)**.
2. SQL Editor: paste and run `supabase-setup.sql`.
3. Authentication > Sign In / Providers: turn **off** "Allow new users to sign up".
4. Authentication > Users > Add user: create an account for yourself and each remote person (set a password).
5. Project Settings > API: copy the Project URL, the `anon` key and the `service_role` key.

## 2. App
Open `index.html`, replace `PASTE_PROJECT_URL` and `PASTE_ANON_KEY` (the anon key is safe to publish; never put service_role in this file).

## 3. GitHub
1. New repository, upload all files (keep `.github/workflows/`).
2. Settings > Pages > Deploy from branch `main` / root. Your app appears at the URL shown.
3. Settings > Secrets and variables > Actions > New repository secret:
   SUPABASE_URL, SUPABASE_ANON_KEY, SUPABASE_SERVICE_KEY,
   SMTP_SERVER, SMTP_PORT (e.g. 465), SMTP_USER, SMTP_PASS, BACKUP_TO
   (Gmail: use an App Password; smtp.gmail.com)
4. Actions tab: run "Keep Supabase awake" and "Weekly backup by email" once manually to test.

## Notes
- GitHub disables scheduled jobs after 60 days without repository activity. If it emails you, click "Enable workflow".
- The email backup holds events, maintenance and the document list, not the document files themselves.
