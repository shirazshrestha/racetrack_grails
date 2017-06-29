import racetrack.User
class BootStrap {

    def init = { servletContext ->
        final String BACKUP_ADMIN = "admin"
        if(!User.findByUserId('admin') ){
            new User(userId:BACKUP_ADMIN,password:'admin').save()
        }
    }
    def destroy = {
    }
}
