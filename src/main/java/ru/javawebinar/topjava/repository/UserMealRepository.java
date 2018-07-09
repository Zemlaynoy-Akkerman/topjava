package ru.javawebinar.topjava.repository;

import ru.javawebinar.topjava.model.UserMeal;

import java.util.Collection;

public interface UserMealRepository {
    UserMeal seva(UserMeal userMeal);

    void delete(int id);

    UserMeal getById(int id);

    Collection<UserMeal> getAll();
}
