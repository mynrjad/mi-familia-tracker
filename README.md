# Cutoff

Debt and expense tracker for 15th/30th paychecks. Static page (`index.html`) + Supabase for login and storage.

## 1. Set up the database
1. In Supabase, open **SQL Editor**, paste `schema.sql`, and run it.
2. (Optional) **Authentication > Providers > Email**: turn off "Confirm email" if you want to sign in right after signing up.
3. After you publish the site, set **Authentication > URL Configuration > Site URL** to your GitHub Pages address.

The publishable key in `index.html` is safe to commit. Row Level Security in `schema.sql` is what keeps each person's data private. Never commit a `service_role` or secret key.

## 2. Push to a new GitHub repo
With the GitHub CLI:
```
cd cutoff-tracker
git init -b main
git add .
git commit -m "Cutoff tracker"
gh repo create cutoff-tracker --public --source=. --push
```
Or create an empty repo on github.com, then:
```
git remote add origin https://github.com/<you>/cutoff-tracker.git
git push -u origin main
```

## 3. Host it
Repo **Settings > Pages > Deploy from branch > main / root**. Your site appears at `https://<you>.github.io/cutoff-tracker/`.
