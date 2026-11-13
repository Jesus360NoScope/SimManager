-- Run once in Supabase: SQL Editor > New query > paste > Run
create table events(id uuid primary key default gen_random_uuid(), title text not null, kind text default 'Inspection',
  start_date date not null, repeat_unit text not null default 'none', repeat_every int not null default 1,
  until_date date, notes text, created_at timestamptz default now());
create table maintenance(id uuid primary key default gen_random_uuid(), title text not null, status text not null default 'open',
  due_date date, notes text, created_at timestamptz default now());
create table documents(id uuid primary key default gen_random_uuid(), name text not null, category text,
  path text not null, size bigint, created_at timestamptz default now());
alter table events enable row level security;
alter table maintenance enable row level security;
alter table documents enable row level security;
create policy "signed-in access" on events for all to authenticated using (true) with check (true);
create policy "signed-in access" on maintenance for all to authenticated using (true) with check (true);
create policy "signed-in access" on documents for all to authenticated using (true) with check (true);
insert into storage.buckets (id, name, public) values ('documents', 'documents', false);
create policy "signed-in files" on storage.objects for all to authenticated
  using (bucket_id = 'documents') with check (bucket_id = 'documents');
