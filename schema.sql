-- Run this once in Supabase: SQL Editor > New query > paste > Run

create table if not exists public.settings (
  user_id uuid primary key default auth.uid() references auth.users on delete cascade,
  s15 numeric not null default 0,
  s30 numeric not null default 0,
  updated_at timestamptz not null default now()
);

create table if not exists public.items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  type text not null check (type in ('debt','exp')),
  name text not null,
  cat text not null,
  amount numeric not null check (amount >= 0),
  due date not null,
  months int not null default 0,
  created_at timestamptz not null default now()
);
create index if not exists items_user_idx on public.items(user_id);

alter table public.settings enable row level security;
alter table public.items enable row level security;

create policy "own settings" on public.settings for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy "own items" on public.items for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
