unit SimpleSocket;

interface

uses
    WinSock, Sysutils;

type
    SocketException = class(Exception);

    ClientSocket = class
    public
        constructor Create(address: string; port: Integer);
        function Send(data: Array of Byte; dataSize: Integer): Integer;
        function Receive(var buffer: Array of Byte; expectedByteCount: Integer): Integer;
        procedure StrictSend(data: Array of Byte; dataSize: Integer);
        procedure StrictReceive(var buffer: Array of Byte; expectedByteCount: Integer);
        procedure Close;
        
    private
        s: TSocket;
        
    end;

implementation

function HostToIP(host: string): string;
var 
    wsdata: TWSAData;
    hostName: array [0..255] of char;
    hostEnt: PHostEnt;
    addr: PChar;
  
begin 
    WSAStartup ($0101, wsdata);
    try
        gethostname(hostName, sizeof (hostName));
        StrPCopy(hostName, host);
        hostEnt := gethostbyname (hostName);
        if (Assigned(hostEnt) and Assigned(hostEnt^.h_addr_list)) then begin
            addr := hostEnt^.h_addr_list^;
            if Assigned (addr) then begin
                Result := Format ('%d.%d.%d.%d', [byte (addr [0]),
                byte (addr [1]), byte (addr [2]), byte (addr [3])]);
            end else begin
                Result := '';
            end
        end else begin
            Result := ''
        end;
    finally
        WSACleanup;
    end;
end;

constructor ClientSocket.Create(address: string; port: Integer);
var
    addr: TSockAddr;
    host: string;
    phost: pchar;
    
begin
    host := HostToIP(address);

    if (host = '') then begin
        raise SocketException.Create('Unable to resolve address [' + address + '] to ip.');
    end;
    
    host := host + #0;
    phost := @host[1];

    if (self.s = INVALID_SOCKET) then begin
        raise SocketException.Create('Unable to create socket.');
    end;

    addr.sin_family := AF_INET;
    addr.sin_addr.S_addr := inet_addr(phost);

    self.s := socket(AF_INET, SOCK_STREAM, 0);
    if self.s = INVALID_SOCKET then begin
        raise SocketException.Create('Unable to create socket.');
    end;

    addr.sin_port := htons(port);

    if (connect(self.s, addr, sizeof(addr)) <> 0) then begin
        raise SocketException.Create('Unable to connect [host="' + phost + '", port=' + IntToStr(port) + '].');
    end;
end;

function ClientSocket.Send(data: Array of Byte; dataSize: Integer): Integer;
    var
        byteCount: Integer;
begin
    result := 0;
    while result < dataSize do begin
        byteCount := WinSock.Send(self.s, data, dataSize - result, 0);
        if byteCount < 0 then
            break;
        inc(result, byteCount);
    end;
end;

function ClientSocket.Receive(var buffer: Array of Byte; expectedByteCount: Integer): Integer;
    var
        byteCount: Integer;
        readCount: Integer;
begin
    byteCount := 0;
    while byteCount < expectedByteCount do begin
        readCount := Recv(self.s, buffer[byteCount], expectedByteCount
- byteCount, 0);
        if readCount < 0 then
            break;
        inc(byteCount, readCount);
    end;
    result := byteCount;
end;

procedure ClientSocket.Close;
begin
    if self.s <> INVALID_SOCKET then
        CloseSocket(self.s);
    self.s := INVALID_SOCKET;
end;

procedure ClientSocket.StrictSend(data: Array of Byte; dataSize: Integer);
    var
        byteCount: Integer;
begin
    byteCount := self.Send(data, dataSize);
    if byteCount <> dataSize then
        raise SocketException.Create('Unable to send a block of '
                + IntToStr(dataSize)
                + ' bytes, only ' + IntToStr(byteCount) + ' bytes sent');
end;

procedure ClientSocket.StrictReceive(var buffer: Array of Byte;
expectedByteCount: Integer);
    var
        byteCount: Integer;
begin
    byteCount := self.Receive(buffer, expectedByteCount);
    if byteCount <> expectedByteCount then
        raise SocketException.Create('Unable to receive a block of '
                + IntToStr(expectedByteCount)
                + ' bytes, only ' + IntToStr(byteCount) + ' bytes received');
end;

var
    winsockData: WSADATA;
begin
    if WSAStartup($101, winsockData) <> 0 then
        raise SocketException.Create('Unable to initialize sockets.');
end.
