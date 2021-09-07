-- Database: new_rest_rant

-- DROP DATABASE new_rest_rant;

CREATE DATABASE new_rest_rant
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Table: public.places

-- DROP TABLE public.places;

CREATE TABLE public.places
(
    place_id integer NOT NULL,
    name character varying NOT NULL,
    state character varying,
    cuisines character varying,
    pic character varying,
    founded integer,
    CONSTRAINT place_pkey PRIMARY KEY (place_id)
)

-- ALTER TABLE public.places
--     OWNER to postgres;

-- Table: public.comments

-- DROP TABLE public.comments;

CREATE TABLE public.comments
(
    comment_id integer NOT NULL,
    place_id smallint NOT NULL,
    content character varying,
    stars smallint NOT NULL,
    rant boolean,
    author character varying,
    CONSTRAINT comments_pkey PRIMARY KEY (comment_id)
)

-- ALTER TABLE public.comments
--     OWNER to postgres;

-- Table: public.places_comments

-- DROP TABLE public.places_comments;

CREATE TABLE public.places_comments
(
    comment_id integer,
    place_id integer,
    CONSTRAINT comment_id FOREIGN KEY (comment_id)
        REFERENCES public.comments (comment_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT place_id FOREIGN KEY (place_id)
        REFERENCES public.places (place_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

-- ALTER TABLE public.places_comments
--     OWNER to postgres;
