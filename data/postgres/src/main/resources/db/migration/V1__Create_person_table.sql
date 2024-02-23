CREATE TABLE account (
                         id uuid NOT NULL,
                         first_name character varying(255),
                         last_name character varying(255)
);

CREATE TABLE usr (
                     id SERIAL PRIMARY KEY,
                     email VARCHAR(255),
                     name VARCHAR(255),
                     password VARCHAR(255)
);

CREATE TABLE difficulty (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(255)
);


CREATE TABLE recipe (
                        id SERIAL PRIMARY KEY,
                        title VARCHAR(255),
                        description TEXT,
                        type VARCHAR(255),
                        image_path VARCHAR(255),
                        video_path VARCHAR(255),
                        optional TEXT,
                        date_publish DATE,
                        time_to_cook_and_preparing VARCHAR(255),
                        time_to_cook VARCHAR(255),
                        time_to_preparing VARCHAR(255),
                        difficulty_id BIGINT,
                        likes INTEGER,
                        dislikes INTEGER,
                        reports INTEGER,
                        rating DOUBLE PRECISION,
                        calories INTEGER,
                        proteins INTEGER,
                        carbohydrates INTEGER,
                        fats INTEGER,
                        author_id BIGINT,
                        FOREIGN KEY (difficulty_id) REFERENCES difficulty(id),
                        FOREIGN KEY (author_id) REFERENCES usr(id)
);

CREATE TABLE ingredient (
                            id SERIAL PRIMARY KEY,
                            recipe_id BIGINT,
                            name VARCHAR(255),
                            value VARCHAR(255),
                            FOREIGN KEY (recipe_id) REFERENCES recipe(id)
);


CREATE TABLE recipe_step (
                             id SERIAL PRIMARY KEY,
                             recipe_id BIGINT,
                             step_number INTEGER,
                             step_name VARCHAR(255),
                             image_path VARCHAR(255),
                             text TEXT,
                             FOREIGN KEY (recipe_id) REFERENCES recipe(id)
);

CREATE TABLE tag (
                     id SERIAL PRIMARY KEY,
                     name VARCHAR(255)
);



CREATE TABLE comment (
                         id SERIAL PRIMARY KEY,
                         user_id BIGINT,
                         recipe_id BIGINT NOT NULL,
                         text TEXT,
                         likes INTEGER,
                         dislikes INTEGER,
                         reports INTEGER,
                         date_published DATE,
                         FOREIGN KEY (user_id) REFERENCES usr(id),
                         FOREIGN KEY (recipe_id) REFERENCES recipe(id)
);


CREATE TABLE favorite (
                          user_id BIGINT,
                          recipe_id BIGINT,
                          PRIMARY KEY (user_id, recipe_id),
                          FOREIGN KEY (user_id) REFERENCES usr(id),
                          FOREIGN KEY (recipe_id) REFERENCES recipe(id)
);

