tableextension 50910 WhseJnlLineExt extends "Warehouse Journal Line"
{
    fields
    {
        field(50901; "Posted By"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

    }

    var
        myInt: Integer;
}