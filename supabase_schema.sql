-- Project Atlas Supabase table
-- Run this in Supabase SQL Editor.

create table if not exists public.atlas_state (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

-- Simple open policy for personal app use.
-- Your anon key can read/write only this table.
alter table public.atlas_state enable row level security;

drop policy if exists "atlas read" on public.atlas_state;
drop policy if exists "atlas write" on public.atlas_state;

create policy "atlas read"
on public.atlas_state for select
using (true);

create policy "atlas write"
on public.atlas_state for insert
with check (true);

create policy "atlas update"
on public.atlas_state for update
using (true)
with check (true);
