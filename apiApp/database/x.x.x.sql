-- Table: public.vessels

-- DROP TABLE public.vessels;

CREATE TABLE public.tracks
(
    id integer,
    lat double precision,
    lon double precision,
    heading integer,
    course integer,
    speed integer,
    status character varying(255) COLLATE pg_catalog."default",
    mmsi integer,
    callsign character varying(255) COLLATE pg_catalog."default",
    imo integer,
    length double precision,
    width double precision,
    draught double precision,
    type character varying(255) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.tracks
    OWNER to postgres;


COPY tracks FROM 'path/to/csv/file' WITH (FORMAT csv);

INSERT INTO statuses (system_name)
SELECT DISTINCT status
FROM tracks;

INSERT INTO types (system_name)
SELECT DISTINCT type
FROM tracks;


UPDATE tracks SET type = (SELECT id from types where system_name = tracks.type);
UPDATE tracks SET status = (SELECT id from statuses where system_name = tracks.status);

ALTER TABLE tracks ALTER COLUMN status SET DATA TYPE int8 USING status::bigint;
ALTER TABLE tracks ALTER COLUMN type SET DATA TYPE int8 USING type::bigint;

INSERT INTO vessels(id , mmsi , callsign  , length , width , draught)
SELECT id , mmsi , callsign  , length , width , draught FROM tracks GROUP BY id , mmsi , callsign  , length , width , draught order by id;



INSERT INTO users(name , email ,email_verified_at , password , remember_token , created_at,updated_at)
VALUES
('Nick Testopoulos' ,'nick@mail.gr', null ,'$2y$10$AGcWQFWAu2G5X4mr4Ey.UelacB/2z6I9DGyLyuXK7id/hNwQbdvpm',null , current_timestamp ,current_timestamp);
