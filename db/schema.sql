CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, 
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE IF NOT EXISTS movies (
    id SERIAL PRIMARY KEY,
    external_id INTEGER UNIQUE NOT NULL, 
    title VARCHAR(255) NOT NULL,
    description TEXT,
    year INTEGER,                        
    genre VARCHAR(100),                  
    stars NUMERIC(3, 1),                 
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS favorites (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    movie_id INTEGER NOT NULL REFERENCES movies(id) ON DELETE CASCADE,
    is_active BOOLEAN DEFAULT TRUE, -- TRUE = Favorito activo, FALSE = Removido (Soft Delete)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    
    
    CONSTRAINT unique_user_movie UNIQUE (user_id, movie_id) 
);


INSERT INTO users (name, email, password) 
VALUES ('Admin', 'admin@proyecto.com', 'hash_de_prueba_123')
ON CONFLICT (email) DO NOTHING;