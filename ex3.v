module main

import json

struct User {
    name string
    age  int
mut:
    is_registered bool
}

fn main() {
    s := '[{"name":"Jeff", "age":37}, {"name":"Arthur", "age":5}]'
    mut users := json.decode([]User, s) or {
        eprintln('Failed to parse json')
        return
    }
    for user in users {
        println('${user.name}: ${user.age}')
    }
    println('')
    for i, mut user in users {
        println('${i}) ${user.name}')
        if !user.can_register() {
            println('Cannot register ${user.name}, they are too young')
            continue
        }
        user.register()
    }
    println('')
    println(json.encode(users))
}

fn (u User) can_register() bool {
    return u.age >= 16
}

fn (mut u User) register() {
    u.is_registered = true
}

