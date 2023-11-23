codeunit 50901 EventsSubscribers
{
    //azhar
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WMS Management", 'OnInitWhseJnlLineCopyFromItemJnlLine', '', false, false)]
    local procedure OnInitWhseJnlLineCopyFromItemJnlLine(var WarehouseJournalLine: Record "Warehouse Journal Line"; ItemJournalLine: Record "Item Journal Line");
    var
        Employee: Record Employee;
    begin
        WarehouseJournalLine."Posted By" := ItemJournalLine."Posted By";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Jnl.-Register Line", 'OnInitWhseEntryCopyFromWhseJnlLine', '', false, false)]
    local procedure OnInitWhseEntryCopyFromWhseJnlLine(var WarehouseEntry: Record "Warehouse Entry"; var WarehouseJournalLine: Record "Warehouse Journal Line"; OnMovement: Boolean; Sign: Integer; Location: Record Location; BinCode: Code[20]; var IsHandled: Boolean);
    var
        Employee: Record Employee;
    begin
        WarehouseEntry."Posted By" := WarehouseJournalLine."Posted By";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnAfterInitGLRegister, '', false, false)]
    local procedure OnAfterInitGLRegister(var GLRegister: Record "G/L Register"; var GenJournalLine: Record "Gen. Journal Line");
    begin
        GLRegister."Posted By" := GenJournalLine."Posted By"; //PCPL-0070 30June23
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnInsertItemRegOnBeforeItemRegInsert, '', false, false)]
    local procedure OnInsertItemRegOnBeforeItemRegInsert(var ItemRegister: Record "Item Register"; var ItemJournalLine: Record "Item Journal Line");
    begin
        ItemRegister."Posted By" := ItemJournalLine."Posted By"; //PCPL-0070 30June23
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnAfterInitBankAccLedgEntry, '', false, false)]
    local procedure OnAfterInitBankAccLedgEntry(var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; GenJournalLine: Record "Gen. Journal Line");
    begin
        BankAccountLedgerEntry."Posted By" := GenJournalLine."Posted By"; //PCPL-0070 30June23
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Activity-Post", OnPostSourceDocumentOnBeforePurchPostRun, '', false, false)]
    local procedure OnPostSourceDocumentOnBeforePurchPostRun(WarehouseActivityHeader: Record "Warehouse Activity Header"; var PurchaseHeader: Record "Purchase Header");
    begin
        PurchaseHeader."Posted By" := WarehouseActivityHeader."Posted By";
        PurchaseHeader.Modify();
    end;

    var
        myInt: Integer;
}