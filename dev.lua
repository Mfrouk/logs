Sub Vytvorit_Grafy()
    Dim ws As Worksheet
    Set ws = ThisWorkbook.Sheets("ICT v podniku")
    
    ' Nastavení rozsahů dat
    Dim rngZamestnanci As Range, rngICT As Range, rngDomova As Range
    
    Set rngZamestnanci = ws.Range("A2:A5") ' Sloupec "Počet zaměstnanců v podniku"
    Set rngICT = ws.Range("B2:B5") ' Sloupec "Zaměstnanci používající ICT"
    Set rngDomova = ws.Range("C2:C5") ' Sloupec "Zaměstnanci pracující z domova"
    
    ' Smazání starých grafů
    Dim objChart As ChartObject
    For Each objChart In ws.ChartObjects
        objChart.Delete
    Next objChart

    ' 1. Sloupcový graf - Zaměstnanci používající ICT
    Dim graf1 As ChartObject
    Set graf1 = ws.ChartObjects.Add(Left:=100, Width:=400, Top:=50, Height:=300)
    With graf1.Chart
        .SetSourceData Source:=Union(rngZamestnanci, rngICT)
        .ChartType = xlColumnClustered
        .HasTitle = True
        .ChartTitle.Text = "Zaměstnanci používající ICT v práci"
    End With
    
    ' 2. Sloupcový graf - Zaměstnanci pracující z domova
    Dim graf2 As ChartObject
    Set graf2 = ws.ChartObjects.Add(Left:=550, Width:=400, Top:=50, Height:=300)
    With graf2.Chart
        .SetSourceData Source:=Union(rngZamestnanci, rngDomova)
        .ChartType = xlColumnClustered
        .HasTitle = True
        .ChartTitle.Text = "Zaměstnanci pracující z domova"
    End With
    
    ' 3. Výsečový graf - Zaměstnanci používající ICT
    Dim graf3 As ChartObject
    Set graf3 = ws.ChartObjects.Add(Left:=100, Width:=400, Top:=400, Height:=300)
    With graf3.Chart
        .SetSourceData Source:=rngICT
        .ChartType = xlPie
        .HasTitle = True
        .ChartTitle.Text = "Podíl zaměstnanců používajících ICT"
    End With
    
    ' 4. Prstencový graf - Všichni zaměstnanci
    Dim graf4 As ChartObject
    Set graf4 = ws.ChartObjects.Add(Left:=550, Width:=400, Top:=400, Height:=300)
    With graf4.Chart
        .SetSourceData Source:=rngZamestnanci
        .ChartType = xlDoughnut
        .HasTitle = True
        .ChartTitle.Text = "Podíl zaměstnanců ve všech kategoriích"
    End With

    MsgBox "Grafy byly úspěšně vytvořeny!", vbInformation
End Sub