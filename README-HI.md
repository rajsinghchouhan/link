# GitHub-only Dynamic Redirect Dashboard

Repository assumed: `rajsinghchouhan/link`, default branch `main`, Pages URL `https://rajsinghchouhan.github.io/link/`.

## Files to upload
Upload the contents of this package into the root of the `link` repository (keep the `admin` and `r` folders):
- `redirects.json`
- `admin/index.html`
- `r/index.html`
- `README-HI.md`

## One-time GitHub setup
1. Open `https://github.com/rajsinghchouhan/link` and upload these files to the root of the `main` branch.
2. Ensure GitHub Pages is enabled for `main` and folder `/ (root)` in Settings → Pages.
3. Create a **fine-grained personal access token** in GitHub Settings → Developer settings → Personal access tokens → Fine-grained tokens.
4. Select only repository `link` and grant **Repository permissions → Contents → Read and write**. Set an expiry and keep token private. Never paste it into repository code or share it with anyone.
5. Open `https://rajsinghchouhan.github.io/link/admin/`, paste the token, click **Load links from GitHub**.

## Add/update a redirect
- Link name: `offer`
- Destination: `https://example.com/your-page`
- Click **Save / Update Link**.
- Put this fixed URL on your site: `https://rajsinghchouhan.github.io/link/r/?id=offer`
- Later, change the destination for `offer` in the dashboard. The fixed redirect URL remains the same.

## Important limitations and security
- This is GitHub-only: it updates `redirects.json` by committing changes via GitHub REST API. The API supports creating/updating repository file contents with a token that has Contents write permission.
- **Do not store the token in source code, localStorage, or any public file.** The dashboard keeps it only in the current page field and does not save it. On a public shared computer, close the tab after use.
- Anyone who can access the public dashboard can see the interface, but cannot save without a token. Treat the token like a password.
- GitHub Pages publishing and browser/CDN caching mean changes may take a little time to appear for visitors.
- This redirects by JavaScript and requires JavaScript to be enabled.
- If a repository's default branch is not `main`, edit `const BRANCH="main";` in `admin/index.html`.
- This is not a server-side HTTP 302 redirect; it is a client-side redirect page, which is the tradeoff for using only GitHub Pages without a backend.
