@Library('libpipelines@master') _

hose {
    EMAIL = 'frameworks2'
    DEVTIMEOUT = 15
    MODULE = 'jmx-metrics-reader'
    REPOSITORY = 'github.com/jmx-metrics-reader'
    BUILDTOOL = 'make'

    DEV = { config ->
        doDocker(conf: config, skipOnPR: true)
    }
}
