-- Create Profile Table
CREATE TABLE profiles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    weight REAL,
);

-- Create Weight History Table
CREATE TABLE weight_history (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    profile_id INTEGER NOT NULL,
    weight REAL NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (profile_id) REFERENCES profiles(id)
);

-- Create Exercises Table
CREATE TABLE exercises (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    notes TEXT,
    type INTEGER NOT NULL CHECK(type BETWEEN 0 AND 3) -- only between 0-3
    default_reps INTEGER CHECK(default_reps > 0),
    default_sets INTEGER CHECK(default_sets > 0),
    default_exercise_value REAL CHECK(default_exercise_value >= 0)
);

-- Create Plans Table
CREATE TABLE plans (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    profile_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    frequency INTEGER NOT NULL CHECK(frequency BETWEEN 0 AND 127),
    FOREIGN KEY (profile_id) REFERENCES profiles(id)
);

-- Create Plan To Exercises Table
CREATE TABLE plan_has_exercise (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    plan_id INTEGER NOT NULL,
    exercise_id INTEGER NOT NULL,
    sets INTEGER NOT NULL CHECK(sets > 0),
    reps INTEGER NOT NULL CHECK(reps > 0),
    exercise_value REAL CHECK(exercise_value >= 0),
    exercise_order INTEGER NOT NULL CHECK(exercise_order >= 0),
    FOREIGN KEY (plan_id) REFERENCES plans(id),
    FOREIGN KEY (exercise_id) REFERENCES exercises(id)
);

-- Create Workout History Table
CREATE TABLE workout_history (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    profile_id INTEGER NOT NULL,
    plan_id INTEGER,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (profile_id) REFERENCES profiles(id),
    FOREIGN KEY (plan_id) REFERENCES plans(id)
);

-- Create Exercise Value History Table
CREATE TABLE exercise_value_history (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    exercise_id INTEGER NOT NULL,
    value REAL CHECK(value >= 0),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sets INTEGER NOT NULL CHECK(sets > 0),
    reps INTEGER NOT NULL CHECK(reps > 0),
    FOREIGN KEY (exercise_id) REFERENCES exercises(id)
);