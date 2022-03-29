import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  static targets = [
    "field",
    "attendance_by_day",
    "attendance_by_month",
    "absence_by_month",
  ];
  static classes = ["hide"];
  static values = {
    selected: String,
  };

  connect() {
    this.change();
  }

  change() {
    this.fieldTarget.value === "Attendance by day"
      ? this.attendance_by_dayTarget.classList.remove(this.hideClass)
      : this.attendance_by_dayTarget.classList.add(this.hideClass);
    this.fieldTarget.value === "Attendance by month"
      ? this.attendance_by_monthTarget.classList.remove(this.hideClass)
      : this.attendance_by_monthTarget.classList.add(this.hideClass);
    this.fieldTarget.value === "Absence by month"
      ? this.absence_by_monthTarget.classList.remove(this.hideClass)
      : this.absence_by_monthTarget.classList.add(this.hideClass);
  }
}
