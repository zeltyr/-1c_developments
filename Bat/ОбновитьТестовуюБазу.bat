echo off
echo ���樠������ �㦥���� ��६�����
set sec=4
Set ProgramPath="C:\Program Files\1cv8\8.3.17.1549\bin\1cv8.exe"
Set WorkHranPath="test2c\KIS_Hran"
Set TestHranPath="D:\1C_Bases\���⮢�� ࠧࠡ�⪠"
Set BackupWorkHranPath="D:\Buffer\���䨣����࠭����.cf"
Set BackupTestHranPath="D:\Buffer\���䨣����⮢�����넮����������.cf"
Set ConfigurationRepositoryPath="\\dc-01.geba.ru\shares\NET\common\IT\�����\Vault1�"

Set Login="�������� �."
Set LoginRep="��ࣥ�"

Set LoginTest="����⍮��ᨡ���"
Set passwdtest=""

echo �����蠥� �� ᥠ��� 1�
taskkill /IM 1cv8.exe /f

echo ��頥� ����� ���� �� ���㦭�� cf 䠩���
del /F /Q %BackupWorkHranPath%
del /F /Q %BackupTestHranPath%

echo ���㦠�� ���䨣��樨 �࠭���� � ��⮢�� ����
%ProgramPath% CONFIG /s%WorkHranPath% /n%Login%  /p"" /ConfigurationRepositoryF %ConfigurationRepositoryPath% /ConfigurationRepositoryN %LoginRep% /ConfigurationRepositoryP "1" /ConfigurationRepositoryDumpCfg%BackupWorkHranPath%
%ProgramPath% CONFIG /f%TestHranPath% /n%Login%  /p"" /DumpCfg%BackupTestHranPath%

echo ����㦠�� ���䨣���� � ��⮢�� ���� � ������塞 ���� ������
%ProgramPath% CONFIG /s%TestHranPath% /n%Login%  /p"" /LoadCfg%BackupWorkHranPath% /UpdateDBCfg

echo ����᪠�� ��⮢�� ���� � �࠭����
set sec=4
set /A sec+=1
Start "" /MIN %ProgramPath% DESIGNER /f%TestHranPath% /n%Login%  /p""
