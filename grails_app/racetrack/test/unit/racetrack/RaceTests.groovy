package racetrack



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Race)
class RaceTests {

    void testSomething() {
       /*fail "Implement me"*/
        def race = new Race()
        race.startDateTime = null
        assertFalse(race.validate())
        def fieldError = race.errors.getFieldError('startDateTime')
        def validationError = fieldError.codes.find {
            it == 'race.startDateTime.validator.invalid' }
        assertNotNull(validationError)
    }

    void testStartDateTimeCustomConstraintWithNullValue() {
        def race = getValidRace()
        race.startDateTime = null
        assertValidationError(race, 'startDateTime',
                'race.startDateTime.validator.invalid')
    }
    void testStartDateTimeCustomConstraintWithPastValue(){
        def race = getValidRace()
        race.startDateTime = new Date(0)
        assertValidationError(race, 'startDateTime',
                'race.startDateTime.validator.invalid')
    }
    void testNameMaxConstraint() {
        def race = getValidRace()
        race.name = 'It may very well take longer to' +
                ' typeout the name of this race' +
                ' than to just go run it.'
        assertValidationError(race, 'name',
                'race.name.maxLength.exceeded')
    }
//...
    private Race getValidRace() {
        def race = new Race()
        race.name = 'Fast 5K'
// 1 day in the future
        race.startDateTime = new Date().plus(1)
        race.city = 'Somewhere'
        race.state = 'NC'
        race.distance = 3.1
        race.cost = 20.00
        race.maxRunners = 1000
// Make sure that we have indeed constructed a
// valid Race object
        assertTrue(race.validate())
        return race
    }
    private assertValidationError(race, fieldName,
                                  errorName) {
        assertFalse(race.validate())
        def fieldError =
                race.errors.getFieldError(fieldName)
        def validationError = fieldError.codes.find {
            it == errorName }
        assertNotNull(validationError)
    }
}
