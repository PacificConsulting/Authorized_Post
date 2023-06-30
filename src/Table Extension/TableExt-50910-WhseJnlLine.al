tableextension 50910 WhseJnlLineExt extends "Warehouse Journal Line"
{
    fields
    {
        field(50900; "Posted by User ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50902; "Posted By"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50903; "Job Title"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50904; Department; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}