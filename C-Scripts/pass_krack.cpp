#include <iostream>
#include <string>
#include <chrono>
#include <fstream>

int main(int argc, char *argv[]) {
		std::fstream file;

		file.open("list.txt",std::ios::out);
		if(!file) return 0;

		const char zahlen[10] = { '0' ,'1','2','3','4','5','6','7','8','9' };
		const std::string suchend(argv[1]);

		const auto start = std::chrono::steady_clock::now(); 
		auto stop_found = start;

#pragma omp parallel for 
		for(int Null_Stelle = 0; Null_Stelle < 26;Null_Stelle++) {
				for(int Eins_Stelle = 0; Eins_Stelle < 26;Eins_Stelle++) {
						for(int Zwei_Stelle = 0; Zwei_Stelle < 26;Zwei_Stelle++) {
								for(int Drei_Stelle = 0; Drei_Stelle < 26;Drei_Stelle++) {
										for(int Vier_Stelle = 0; Vier_Stelle < 10; Vier_Stelle++) {
												for(int Fuenf_Stelle = 0; Fuenf_Stelle < 10; Fuenf_Stelle++) {
														for(int Sechs_Stelle = 0; Sechs_Stelle < 10; Sechs_Stelle++) {
																for(int Sieben_Stelle = 0; Sieben_Stelle < 10; Sieben_Stelle++) {
																		std::string wort{char('A'+Null_Stelle),char('a'+Eins_Stelle),char('a'+Zwei_Stelle),char('a'+Drei_Stelle),zahlen[Vier_Stelle], zahlen[Fuenf_Stelle], zahlen[Sechs_Stelle], zahlen[Sieben_Stelle]};
																		if(suchend == wort) {
																				std::cout << "Gefunden nach: " << (Null_Stelle+1)*(Eins_Stelle+1)*(Zwei_Stelle+1)*(Drei_Stelle+1)*(Vier_Stelle+1)*(Fuenf_Stelle+1)*(Sechs_Stelle+1)*(Sieben_Stelle+1) << " Iterationen" << std::endl;
																				stop_found = std::chrono::steady_clock::now(); 
																		} else if(suchend == "wordlist") {
																				file << wort << std::endl;
																		}
																}
														}
												}
										}
								}
						}
				}
		}
		const auto stop_end = std::chrono::steady_clock::now(); 

		auto dauer_gefunden = std::chrono::duration_cast<std::chrono::milliseconds>(stop_found - start); 
		auto dauer_ende = std::chrono::duration_cast<std::chrono::seconds>(stop_end - start);
		if(suchend != "wordlist")
		std::cout << "Passwort gefunden in: " << dauer_gefunden.count() << " Millisekunden\nGesamte Suchdauer: " << dauer_ende.count() << " Sekunden" << std::endl;
		file.close();
}
