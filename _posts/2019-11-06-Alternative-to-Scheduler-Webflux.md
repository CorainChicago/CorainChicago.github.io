 This is cool:
 
 Flux.range(0, eventRate)
                    .parallel()
                    .runOn(Schedulers.parallel())
                    .doOnNext(i -> LOGGER.info("In the flux {} ", i))
                    .subscribe();
                    
                    
                    but not exactily what I want


```java

@Override
    public void start() {
        LOGGER.info("called start");
        startRunning();
        processEvents();

    }
    

    public void processEvents() {
        final ConnectableFlux<CatObject> connectableFlux = getConnectableFlux();
        connectableFlux.parallel()
                .runOn(Schedulers.fromExecutor(executor))
                .flatMap(e -> Flux.just(e)
                        .flatMap(eventDO -> {
                            LOGGER.info("json: {}", eventDO);
                            if (StringUtils.isNotBlank(e.toString())) {
                                try {
                                    LOGGER.info("This is where I publish e {}", e);
                                } catch (Exception ex) {
                                    LOGGER.error("DefaultMessagePublisher Error: ", ex);
                                }
                            }
                            return Flux.fromIterable(Collections.emptyList());
                        }))
                .subscribe();
        connectableFlux.connect();
    }

    public ConnectableFlux<CatObject> getConnectableFlux() {
        final Flux<CatObject> CatObjectFlux = Flux.create(sink -> {
            LOGGER.info("in here");
            while (isRunning()) {
                LOGGER.trace("Running...");
                if (true) {
                    try {
                        LOGGER.info("This is where I make a CatObject");
                    } catch (final Throwable t) {
                        LOGGER.error(t.getMessage(), t);
                    }
                }
            }
            sink.complete();
        });
        iElementDOFlux.publishOn(Schedulers.fromExecutor(executor));
        return CatObjectFlux.publish();
    }

    public void startRunning() {
        this.runningPoller.set(true);
    }

    public void stopRunning() {
        this.runningPoller.set(false);
    }

    private boolean isRunning() {
        return runningPoller.get();
    }


```


the runningpoller is an atomic boolean.
