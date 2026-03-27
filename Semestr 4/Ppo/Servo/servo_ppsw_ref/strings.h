
enum CompResult { EQUAL, NOTEQUAL } ;

enum Result {ERROR,OK};

void CopyString ( char acSource[], char acDestination[] ) ;
void AppendString(char cSourceStr[],char cDestinationStr[]);
void ReplaceCharacterInString ( char acString1[] , char cOldChar, char cNewChar);
enum CompResult eCompareString ( char acString1[] , char acString2[] ) ;
enum Result eHexStringToUInt ( char cStr[] , unsigned int *puiValue );
void UIntToHexStr ( unsigned int uiValue, char cStr[] ) ;
void AppendUIntToString ( unsigned int uiValue, char cDestinationStr[] );


