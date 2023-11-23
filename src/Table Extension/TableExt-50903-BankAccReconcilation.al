tableextension 50903 BankAccReconExt extends "Bank Acc. Reconciliation"
{
    fields
    {
        field(50901; "Posted By"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Staff Master".ID;
            Editable = false;
        }
    }

    var
        myInt: Integer;
}