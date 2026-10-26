# LinkPilot — Smart URL Redirect Dashboard

A responsive dashboard for managing shared redirects. It uses GitHub Pages for static hosting and Supabase for shared data and secure admin login.

## Important about GitHub Pages

GitHub Pages is static hosting, not a server-side redirect service. This project uses its `404.html` fallback to route a requested slug back into the app. This workaround should be tested on the exact GitHub Pages project URL before you share links. If you need dependable branded short URLs for ads or production use, a custom domain with a Cloudflare Worker/server-side redirect is more reliable.

## 1. Set up Supabase

1. Create a project at https://supabase.com/
2. Open **SQL Editor**, paste `supabase.sql`, and run it.
3. Open **Project Settings → API** (or Connect) and copy the Project URL and the publishable/anon key.
4. In `app.js`, replace `https://YOUR_PROJECT.supabase.co` and `YOUR_SUPABASE_ANON_KEY`.
5. In **Authentication → Users**, create your admin user with your email and a strong password. Disable public sign-ups in Authentication settings.
6. Copy the admin user's UUID from the Users page. In SQL Editor run:
   ```sql
   insert into public.admin_users(user_id) values ('PASTE-ADMIN-USER-UUID-HERE');
   ```
7. Keep the service-role/secret key private. Only the publishable/anon key belongs in the front-end.

## 2. Publish on GitHub Pages

1. Create a repository named `linkpilot`.
2. Upload `index.html`, `404.html`, `style.css`, `app.js`, `supabase.sql`, and `README.md` to its root.
3. Open **Settings → Pages**.
4. Select **Deploy from a branch**, choose `main` and `/(root)`, then Save.
5. Wait for deployment and open the published Pages URL.

Project site URLs usually look like `https://USERNAME.github.io/REPOSITORY/`; user-site URLs look like `https://USERNAME.github.io/`. A link slug is intended to look like `.../offer`. Confirm custom paths work with the deployed repository before distributing them.

## 3. Use it

- Sign in with your Supabase admin account.
- Choose **Create link** and enter a name, slug (for example `offer`), and destination (`https://example.com/page`).
- Copy the fixed URL and share it.
- Later edit the destination while keeping the slug unchanged; the database update is shared with visitors.
- Pause, resume, or delete links from the dashboard.

## Security

- Row Level Security limits write access to UUIDs added to `admin_users`.
- Turn off public sign-ups and use a strong admin password.
- Never commit Supabase service-role keys, passwords, or secrets to GitHub.
- Only use redirects for destinations you control or are authorized to share.

## Files

- `index.html`: dashboard and login UI
- `style.css`: responsive styling
- `app.js`: authentication, link management, and redirect lookup
- `404.html`: GitHub Pages fallback
- `supabase.sql`: database schema and Row Level Security
