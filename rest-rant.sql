-- Table: public.places

-- DROP TABLE public.places;

CREATE TABLE public.places
(
    place_id serial NOT NULL,
    place_name character varying(255) NOT NULL,
    pic character varying,
    cuisines character varying NOT NULL,
    state character varying,
    founded smallint,
    CONSTRAINT place_pkey PRIMARY KEY (place_id)
)

TABLESPACE pg_default;

ALTER TABLE public.places
    OWNER to postgres;
	
CREATE TABLE public.comments
(
    comment_id serial NOT NULL,
    place_id smallint NOT NULL,
    content text,
    stars smallint NOT NULL,
    rant boolean,
    author character varying,
    CONSTRAINT comment_pkey PRIMARY KEY (comment_id),
    CONSTRAINT comment_place_id_fkey FOREIGN KEY (place_id)
        REFERENCES public.places (place_id)
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public.comments
    OWNER to postgres;