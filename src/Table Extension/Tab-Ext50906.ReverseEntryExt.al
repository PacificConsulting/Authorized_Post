tableextension 50906 "Reverse Entry Ext" extends "Reversal Entry"
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
}
