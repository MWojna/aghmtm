void Keyboard_Init(void);

enum KeyboardState {RELASED, BUTTON_1, BUTTON_2, BUTTON_3, BUTTON_4};
enum KeyboardState eKeyboard_Read(void);
