-- Run in Supabase Dashboard > SQL Editor
create extension if not exists pgcrypto;
create table if not exists public.redirect_links (
 id uuid primary key default gen_random_uuid(),
 name text not null check (char_length(name) between 1 and 80),
 slug text not null unique check (slug ~ '^[A-Za-z0-9_-]{1,60}$'),
 destination text not null check (destination ~ '^https?://'),
 is_active boolean not null default true,
 created_at timestamptz not null default now(),
 updated_at timestamptz not null default now()
);
create table if not exists public.admin_users (user_id uuid primary key references auth.users(id) on delete cascade);
alter table public.redirect_links enable row level security;
alter table public.admin_users enable row level security;
create or replace function public.is_linkpilot_admin()
returns boolean language sql stable security definer set search_path=public
as $$ select exists(select 1 from public.admin_users where user_id=auth.uid()); $$;
drop policy if exists "Public can read active redirects" on public.redirect_links;
create policy "Public can read active redirects" on public.redirect_links for select to anon,authenticated using (is_active=true or public.is_linkpilot_admin());
drop policy if exists "Admins can insert redirects" on public.redirect_links;
create policy "Admins can insert redirects" on public.redirect_links for insert to authenticated with check (public.is_linkpilot_admin());
drop policy if exists "Admins can update redirects" on public.redirect_links;
create policy "Admins can update redirects" on public.redirect_links for update to authenticated using (public.is_linkpilot_admin()) with check (public.is_linkpilot_admin());
drop policy if exists "Admins can delete redirects" on public.redirect_links;
create policy "Admins can delete redirects" on public.redirect_links for delete to authenticated using (public.is_linkpilot_admin());
drop policy if exists "No direct admin list access" on public.admin_users;
create policy "No direct admin list access" on public.admin_users for select to authenticated using (user_id=auth.uid());
-- After creating the admin user in Authentication > Users, run:
-- insert into public.admin_users(user_id) values ('YOUR_AUTH_USER_UUID');
