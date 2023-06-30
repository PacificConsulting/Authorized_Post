tableextension 50912 ExpenseBookingHdrExt extends "Expense Booking Header"
{
    fields
    {
        field(50901; "Posted By"; Code[10])
        {
            Caption = 'Posted By';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    var
        myInt: Integer;
}