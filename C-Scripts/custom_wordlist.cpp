#include <iostream>
#include <string>
#include <fstream>

int main() {
		std::fstream file;

		file.open("list.txt",std::ios::out);
		if(!file) return 0;

		const char zahlen[10] = { '0' ,'1','2','3','4','5','6','7','8','9' };
		for(int Null_Stelle = 0; Null_Stelle < 26;Null_Stelle++) {
				for(int Eins_Stelle = 0; Eins_Stelle < 58;Eins_Stelle++) {
						for(int Zwei_Stelle = 0; Zwei_Stelle < 58;Zwei_Stelle++) {
								for(int Vier_Stelle = 0; Vier_Stelle < 10; Vier_Stelle++) {
										for(int Fuenf_Stelle = 0; Fuenf_Stelle < 10; Fuenf_Stelle++) {
														std::string wort{char('A'+Null_Stelle),char('A'+Eins_Stelle),char('A'+Zwei_Stelle),zahlen[Vier_Stelle], zahlen[Fuenf_Stelle]};
														file << wort << std::endl;	
										}
								}
						}
				}
		}
		file.close();
}
