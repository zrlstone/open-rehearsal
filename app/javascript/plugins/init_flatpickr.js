import flatpickr from "flatpickr";

const today = new Date();

const tomorrow = new Date(today);

tomorrow.setDate(tomorrow.getDate() + 1);


flatpickr('.datetime-input', {
                                enableTime: true,
                                minDate: tomorrow,
                                defaultDate: tomorrow,
                                time_24hr: true,
                                minuteIncrement: 1,
                                inline: true,
                                altInput: true,
                                altFormat: "J F Y, H:i",
                                minTime: "09:00",
                                maxTime: "22:30"
                              });


