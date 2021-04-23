## Windows diskpart - create .bat file - clean format usb

### Open **Command Prompt** **Run as administrator**

```powershell
diskpart
```
```powershell
list disk
```
```powershell
select disk 3
```
```powershell
clean
```
```powershell
create partition primary
```
```powershell
select partition 1
```
```powershell
format FS=NTFS label=Data quick
```
```powershell
assign letter=g
```


```powershell
exit
```

