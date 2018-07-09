package ru.javawebinar.topjava.repository;

import ru.javawebinar.topjava.model.UserMeal;

import java.util.Collection;

public class UserMealRepositoryImpl implements UserMealRepository {

    private UserMealRepository repository = new InMemoryUserMealRepository();


    @Override
    public UserMeal seva(UserMeal userMeal) {
        return repository.seva(userMeal);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public UserMeal getById(int id) {
        return repository.getById(id);
    }

    @Override
    public Collection<UserMeal> getAll() {
        return repository.getAll();
    }
}
