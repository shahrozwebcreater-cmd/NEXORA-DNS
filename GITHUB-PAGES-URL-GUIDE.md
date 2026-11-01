# Give NEXORA DNS a shorter GitHub Pages URL

Your current project site is:

`https://shahrozwebcreater-cmd.github.io/NEXORA-DNS/`

GitHub Pages also supports a root user site:

`https://shahrozwebcreater-cmd.github.io/`

## How to create the root URL

GitHub requires a repository whose exact name matches the GitHub username plus `.github.io`.

For this account, the repository must be named:

`shahrozwebcreater-cmd.github.io`

1. Open https://github.com/new while signed in to the correct GitHub account.
2. Set Repository name to exactly `shahrozwebcreater-cmd.github.io`.
3. Set visibility to Public.
4. Create the repository. Do not initialize it with a README if you want a clean upload.
5. In the new repository, open Settings → Pages.
6. Choose Deploy from a branch, branch `main`, folder `/(root)`, then Save.
7. Add the website files from the existing `NEXORA-DNS` repository root: `index.html` and `config.js`. Also copy any assets the page uses.
8. Wait for the Pages deployment to complete.

After that, the root URL should be:

`https://shahrozwebcreater-cmd.github.io/`

The existing project URL can continue to work separately.

## Important

- Creating this special repository does not require buying a domain.
- It is still a GitHub-provided address, not a custom branded domain such as `nexoradns.com`.
- A custom domain requires a domain you own/control and DNS records pointing to GitHub Pages.
- Do not add a CNAME file with a domain you do not own.
- Keep the Supabase anon key in the frontend only if Row Level Security is correctly enabled. Never publish a Supabase service_role key.
- GitHub Pages is static hosting. It cannot safely hold private DNS provider API tokens or run an authoritative DNS server. Provider secrets and provisioning must live in a secured backend.

## Current deployment

The existing site remains at:

https://shahrozwebcreater-cmd.github.io/NEXORA-DNS/
