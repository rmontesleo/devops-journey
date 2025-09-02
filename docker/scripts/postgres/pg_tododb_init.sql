
CREATE TABLE users (
    id  SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE todos (
    id  SERIAL PRIMARY KEY,
    created_by INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(200) NOT NULL,
    is_completed BOOLEAN  DEFAULT false NOT NULL,
    FOREIGN KEY (created_by) REFERENCES users(id)
);