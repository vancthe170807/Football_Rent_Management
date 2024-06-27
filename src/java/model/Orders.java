package model;

import java.time.LocalDateTime;

public class Orders {
    private int OrderID;
    private String CustomerPhone;
    private String EmployeePhone;
    private String FieldCode;
    private LocalDateTime BookingDate;
    private LocalDateTime StartTime;
    private LocalDateTime EndTime;
    private int TotalAmount;
    private String Status;

    public Orders() {
    }

    public Orders(int OrderID, String CustomerPhone, String EmployeePhone, String FieldCode, LocalDateTime BookingDate, LocalDateTime StartTime, LocalDateTime EndTime, int TotalAmount, String Status) {
        this.OrderID = OrderID;
        this.CustomerPhone = CustomerPhone;
        this.EmployeePhone = EmployeePhone;
        this.FieldCode = FieldCode;
        this.BookingDate = BookingDate;
        this.StartTime = StartTime;
        this.EndTime = EndTime;
        this.TotalAmount = TotalAmount;
        this.Status = Status;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public String getCustomerPhone() {
        return CustomerPhone;
    }

    public void setCustomerPhone(String CustomerPhone) {
        this.CustomerPhone = CustomerPhone;
    }

    public String getEmployeePhone() {
        return EmployeePhone;
    }

    public void setEmployeePhone(String EmployeePhone) {
        this.EmployeePhone = EmployeePhone;
    }

    public String getFieldCode() {
        return FieldCode;
    }

    public void setFieldCode(String FieldCode) {
        this.FieldCode = FieldCode;
    }

    public LocalDateTime getBookingDate() {
        return BookingDate;
    }

    public void setBookingDate(LocalDateTime BookingDate) {
        this.BookingDate = BookingDate;
    }

    public LocalDateTime getStartTime() {
        return StartTime;
    }

    public void setStartTime(LocalDateTime StartTime) {
        this.StartTime = StartTime;
    }

    public LocalDateTime getEndTime() {
        return EndTime;
    }

    public void setEndTime(LocalDateTime EndTime) {
        this.EndTime = EndTime;
    }

    public int getTotalAmount() {
        return TotalAmount;
    }

    public void setTotalAmount(int TotalAmount) {
        this.TotalAmount = TotalAmount;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }
}
