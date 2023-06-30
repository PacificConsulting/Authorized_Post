tableextension 50918 BankAccStatementExt extends "Bank Account Statement"
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