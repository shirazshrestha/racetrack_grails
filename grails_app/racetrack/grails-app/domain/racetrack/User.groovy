package racetrack

class User {

    String userId
    String password

    static constraints = {
        userId(length: 6..8, unique: true)
    }
}
