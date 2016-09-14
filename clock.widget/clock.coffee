#Clock Widget for Übersicht
#Carson Woods

#forces Übersicht to update clock time every second. Decrease for improved accuracy
refreshFrequency: "1s"

style: """

  font-family: Helvetica Neue, Arial, Sans;
  font-size: 750%;
  margin-left: 44%;

  .time {
    border: solid;
    border-width: 2px;
    max-height: 225px;
    margin-top: 150px;
  }

  p {
    line-height: 1px;
    margin-top: 50px;
  }

"""

render: -> """

  <div class="container">
    <div class="time">
        <p><span class="hour"></span></p>
        <p><span class="minute"></span></p>
    </div>
  </div>

"""

update: (output, domEl) ->

  #instantiate new Date Object
  time = new Date

  #booleans to adjust settings
  millitaryTime = false
  showSeconds = false
  part = true

  #gets current hours minutes and seconds and sets default time of AM
  hour = time.getHours()
  minutes = time.getMinutes()
  half = "AM"

  #determins if AM or PM
  half = "PM" if hour > 12

  #adjusts single digit minutes to be double digits
  minutes = "0" + minutes if minutes < 10

  #changes millitary time to 12-hour clock span
  hour = hour - 12 if hour > 12 && !millitaryTime
  hour =  "0" + hour if hour < 10

  $(domEl).find('.hour').text("#{hour}")
  $(domEl).find('.minute').text("#{minutes}")
  $(domEl).find('.half').text("#{half}") if !millitaryTime && part
