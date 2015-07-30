PATSHOMEQ="$(PATSHOME)"

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

#PATSCCFLAGS=
#PATSCCFLAGS=-O2
#
# '-flto' enables link-time optimization such as inlining lib functions
#
PATSCCFLAGS=-O2 -flto

######

cleanall::

minimal: minimal.dats ; \
  $(PATSCC) -DATS_MEMALLOC_GCBDW $(PATSCCFLAGS) -o $@ $< -lgc || echo $@ ": ERROR!!!"
swap_runner: swap_runner.dats ; \
  $(PATSCC) -DATS_MEMALLOC_GCBDW $(PATSCCFLAGS) -o $@ $< || echo $@ ": ERROR!!!"
swap_from_ats: swap_from_ats.dats ; \
  $(PATSCC) -DATS_MEMALLOC_GCBDW $(PATSCCFLAGS) -o $@ $< || echo $@ ": ERROR!!!"
safe_malloc: safe_malloc.dats ; \
  $(PATSCC) -DATS_MEMALLOC_GCBDW $(PATSCCFLAGS) -o $@ $< || echo $@ ": ERROR!!!"
cleanall:: ; $(RMF) minimal

######

#
# You may find these rules useful
#

# %_sats.o: %.sats ; $(PATSCC) $(PATSCCFLAGS) -c $< || echo $@ ": ERROR!!!"
# %_dats.o: %.dats ; $(PATSCC) $(PATSCCFLAGS) -c $< || echo $@ ": ERROR!!!"

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) safe_malloc
clean:: ; $(RMF) swap_runner
clean:: ; $(RMF) swap_from_ats
clean:: ; $(RMF) minimal

cleanall:: clean
