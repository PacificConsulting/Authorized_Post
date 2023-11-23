tableextension 50917 BankAccLedgEntryExt extends "Bank Account Ledger Entry"
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