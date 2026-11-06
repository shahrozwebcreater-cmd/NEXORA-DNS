-- NEXORA DNS admin access
-- Run this in Supabase Dashboard → SQL Editor.
-- Grants cross-user access to dns_records ONLY to the authenticated account
-- whose JWT email exactly matches shahrozwebcreater@gmail.com.

create or replace function public.is_nexora_admin()
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select coalesce((auth.jwt() ->> 'email') = 'shahrozwebcreater@gmail.com', false);
$$;

revoke all on function public.is_nexora_admin() from public;
grant execute on function public.is_nexora_admin() to authenticated;

drop policy if exists "NEXORA admin can read all records" on public.dns_records;
create policy "NEXORA admin can read all records"
on public.dns_records for select to authenticated
using (public.is_nexora_admin());

drop policy if exists "NEXORA admin can insert records" on public.dns_records;
create policy "NEXORA admin can insert records"
on public.dns_records for insert to authenticated
with check (public.is_nexora_admin());

drop policy if exists "NEXORA admin can update all records" on public.dns_records;
create policy "NEXORA admin can update all records"
on public.dns_records for update to authenticated
using (public.is_nexora_admin())
with check (public.is_nexora_admin());

drop policy if exists "NEXORA admin can delete all records" on public.dns_records;
create policy "NEXORA admin can delete all records"
on public.dns_records for delete to authenticated
using (public.is_nexora_admin());

-- Existing per-user policies remain in place. These admin policies add
-- access only for the exact email above. Never expose a service_role key.
