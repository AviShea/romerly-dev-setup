-- USERS
create table profiles (
  id uuid references auth.users primary key,
  name text,
  created_at timestamp default now()
);

-- TRIPS
create table trips (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid references profiles(id),
  title text,
  start_date date,
  end_date date,
  created_at timestamp default now()
);

-- TRIP MEMBERS
create table trip_members (
  trip_id uuid references trips(id),
  user_id uuid references profiles(id),
  role text check (role in ('owner','contributor','viewer')),
  primary key (trip_id, user_id)
);

-- FLIGHTS
create table flights (
  id uuid primary key default gen_random_uuid(),
  trip_id uuid references trips(id),
  provider text,
  external_url text,
  price numeric,
  created_at timestamp default now()
);

-- VOTES
create table votes (
  id uuid primary key default gen_random_uuid(),
  trip_id uuid references trips(id),
  item_type text,
  status text,
  created_at timestamp default now()
);

-- SAFETY
create table safety_contacts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id),
  name text,
  phone text,
  email text
);

