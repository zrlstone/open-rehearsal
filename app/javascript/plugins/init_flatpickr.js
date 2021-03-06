import flatpickr from "flatpickr";

flatpickr('.datetime-input', {
                                enableTime: true,
                                minDate: Date.now(),
                                altInput: true,
                                altFormat: "F j, Y H:i" });


