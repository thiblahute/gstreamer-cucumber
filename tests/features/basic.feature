Feature: Basic pipeline manipulation

  Background:
    Given The validate configuration 'validateflow, expectations-dir=tmp/, pad=sink:sink, ignored-event-types={ tag }'
    Given Validate is activated
    Given Pipeline is 'videotestsrc name=src ! fakevideosink enable-last-sample=true name=sink'

  Scenario: video source pattern
    When I play the pipeline
    Then The user can see a frame on sink

    When I set property src::pattern to green
    Then I should see significant color lime on sink

    When I stop the pipeline
    Then Validate should not report any issue
